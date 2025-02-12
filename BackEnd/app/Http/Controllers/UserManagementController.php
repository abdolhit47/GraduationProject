<?php

namespace App\Http\Controllers;

use App\Mail\OTPMail;
use App\Models\CommUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserManagementController extends Controller {
    public function index() {
        $users = User::select('id', 'first_name', 'father_name', 'last_name', 'username', 'email', 'role', 'phone')->get();
        return response()->json($users);
    }
    public function viewEmployee() {
        $users = User::with('commusers')->select('id', 'first_name', 'father_name', 'last_name', 'username', 'phone')->get();
        $users = $users->map(function ($user) {
            $user = $user->commusers->map(function ($user) {
                return [
                    'id' => $user->user->id,
                    'name' => $user->user->getFullNameAttribute(),
                    'phone' => $user->user->phone,
                    'country' => $user->commission->country,
                ];
            });
            return $user;
        });
        return ($users);
    }
    public function info() {
        $user = Auth::user();
        $user = [
            'id' => $user->id,
            'fullName' => $user->getFullNameAttribute(),
            'username' => $user->username,
            'email' => $user->email,
            'phone' => $user->phone,];
        return response()->json($user);
    }
    public function selectuser()  {
        $users = User::select('id','role')->whereIn('role',['general_manager','employee1','employee2'])->get();
        $users = $users->map(function ($user){
            return ['value'=>$user->id,'label'=>$user->role];
        });
        return response()->json($users);
    }
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'first_name' => ['required', 'string', 'max:255'],
            'father_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string','unique:users,username', 'max:255'],
            'email' => [
                'required',
                'email',
                'unique:users,email',
                'max:255'
            ],
            'role' => ['required', Rule::in([ 'employee1', 'employee2', 'general_manager','delivery_agent'])],
            'phone' => ['required','nullable', 'string','unique:users,phone', 'regex:/^([0-9\s\-\+\(\)]*)$/', 'max:10'],
//            'commission_id' => ['required', 'array'],
//            'commission_id.*' => ['integer', 'exists:commissions,id'],
        ], [
            'first_name.required' => 'The first name field is required.',
            'father_name.required' => 'The father name field is required.',
            'last_name.required' => 'The last name field is required.',
            'username.required' => 'The username field is required.',
            'email.required' => 'The email field is required.',
            'email.unique' => 'The email has already been taken.',
            'email.email' => 'The email must be a valid email address.',
            'role.required' => 'The role field is required.',
            'phone.regex' => 'The phone field must be a valid phone number.',
            'phone.max' => 'The phone field may not be greater than 10 characters.',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        $user = User::create([
            'first_name' => $request->first_name,
            'father_name' => $request->father_name,
            'last_name' => $request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'role' => $request->role,
            'phone' => $request->phone,
            'password' => Hash::make('123456789'),
//            'commission_id'=> $request->role == 'general_manager' ? 1 : ($request->role == 'employee1' ? 2 : ($request->role == 'employee2' ? 3: Null)),
        ]);
        // Add commission
        if($request->role == 'general_manager') {
            $commission = new CommUser;
            $commission->user_id = $user->id;
            $commission->commission_id = 1;
            $commission->save();
        }
        elseif ($request->role == 'employee1') {
            for ($i = 2; $i < 4; $i++) {
                $commission = new CommUser;
                $commission->user_id = $user->id;
                $commission->commission_id = $i;
                $commission->save();
            }

        }

        return response()->json(['success' => true], 201);
    }

    public function getUser($userId) {
        $user = User::find($userId);
        return response()->json($user);
    }
    public function userSalary($userId) {
        $user = User::find($userId);
        $user = [
            'id' => $user->id,
            'fullname' => $user->getFullNameAttribute(),
            'role' => $user->role,
            'salary' => $user->salary,
        ];
        return response()->json($user);
    }
    public function editUser(Request $request, $userId = Null) {
        $userId =  $userId ?? Auth::user()->id;
//        dd($userId);
        $validator = Validator::make($request->all(), [
             'first_name' => ['nullable', 'string', 'max:255'],
             'father_name' => ['nullable', 'string', 'max:255'],
             'last_name' => ['nullable', 'string', 'max:255'],
            'username' => ['nullable', 'string','unique:users,username,'.$userId, 'max:255'],
            'email' => [
                'nullable',
                'email',
                'unique:users,email,'.$userId,
                'max:255'
            ],
             'role' => ['nullable', Rule::in([ 'employee1', 'employee2', 'general_manager','delivery_agent'])],
             'phone' => ['nullable', 'string','unique:users,phone,'.$userId, 'regex:/^([0-9\s\-\+\(\)]*)$/', 'max:10'],
        ], [
            'username.unique' => 'The username has already been taken.',
            'email.unique' => 'The email has already been taken.',
            'email.email' => 'The email must be a valid email address.',
             'phone.regex' => 'The phone field must be a valid phone number.',
             'phone.max' => 'The phone field may not be greater than 10 characters.',

        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }
        if($userId) {
            $user = User::find($userId);
        }else{
            $user = Auth::user();
        }

        $user->update($validator->getData());
        return response()->json(['success' => true,'message' => 'User updated successfully'], 200);
    }
    public function deleteUser($userId) {
        $user = User::findOrFail($userId);
        $user->delete();

        return response()->json(['success' => true, 'message' => 'User deleted successfully']);
    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'first_name' => ['required', 'string', 'max:255'],
            'father_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'unique:users', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'phone' => ['required', 'string', 'unique:users', 'regex:/^([0-9\s\-\+\(\)]*)$/', 'max:10'],
        ], [
            'first_name.required' => 'The first name field is required.',
            'father_name.required' => 'The father name field is required.',
            'last_name.required' => 'The last name field is required.',
            'username.required' => 'The username field is required.',
            'username.unioque' => 'The username has already been taken.',
            'email.required' => 'The email field is required.',
            'email.unique' => 'The email has already been taken.',
            'email.email' => 'The email must be a valid email address.',
            'phone.regex' => 'The phone field must be a valid phone number.',
            'phone.max' => 'The phone field may not be greater than 10 characters.',
            'phone.unique' => 'The phone has already been taken.',
            'password.confirmed' => 'The password confirmation does not match.',
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }
        User::create([
            'first_name' => $request->first_name,
            'father_name' => $request->father_name,
            'last_name' => $request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'customer',
            'phone' => $request->phone,
        ]);
        return response()->json(['success' => true], 200);
    }

    public function login(Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['required', 'string', 'min:8'],
        ], [
            'email.required' => 'The email field is required.',
            'email.email' => 'The email must be a valid email address.',
            'password.required' => 'The password field is required.',
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }
        $user = User::where('email', $request->email)->first();
        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json(['success' => false, 'message' => 'The provided credentials are incorrect.'], 401);
        }

        $otp = random_int(100000, 999999);
        $token_otp = Str::random(64);
        Cache::put("otp:{$token_otp}", ['email' => $user->email, 'otp' => $otp], now()->addMinutes(5));
        Mail::to($request->email)->send(new OTPMail($request->email, $otp,  $token_otp));
        return response()->json([
            "success" => true,
            'message' => "رجاء تحقق من البريد الإلكتروني",
            'token' => $token_otp,
        ]);
        //return response()->json(['success' => true, 'access_token' => $token, 'token_type' => 'Bearer', 'user' => $user]);
    }
//change password with login
    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(),[
                'newPassword' => 'required|string|min:8',       // Validate the new password
            ]
            ,[
                'newPassword.required' => 'The new password field is required.',
                'newPassword.min' => 'The new password must be at least 8 characters.',
            ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::where('email',Auth::user()->email)->first();
        // Update the user's password
        $user->password = Hash::make($validator->getData()['newPassword']);
        $user->save();
        return response()->json(['message' => 'Password changed successfully']);
    }

    //verify otp after login
    public function check(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|string',
            'token' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([$validator->errors(),
                'message' => "معلومات غير صالحة",
            ], 422);
        }
        $cache = Cache::get("otp:{$request->token}");
        if ($cache) {
            if ($request->otp == $cache['otp']) {
                $user = User::where('email', $cache['email'])->first();
                //$user->update(['is_verified' => 1]);
                Cache::forget("otp:{$request->token}");
                $tokenTTL = JWTAuth::factory()->getTTL();
                $token = JWTAuth::fromUser($user);
                return response()->json([
                    'message' => 'OTP verified',
                    "FullName" => $user->FullName,
                    'username' => $user->username,
                    "access" => $token,
                    'type' => $user->role,
                    'refresh' => '',
                    'token_expiration' => $tokenTTL,
                ], 200);
            }
        } else {
            return response()->json(['message' => 'Invalid OTP'], 401);
        }
        return response()->json(['message' => 'Invalid OTP'], 401);
    }
    //resend otp after login
    public function resend(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => "معلومات غير صالحة",
            ], 422);

        }
        $cache = Cache::get("otp:{$request->token}");
        if ($cache) {
            $otp = random_int(100000, 999999);
            Cache::put("otp:{$request->token}", ['email' => $cache['email'], 'otp' => $otp], now()->addMinutes(5));
            Mail::to($cache['email'])->send(new OTPMail($cache['email'], $otp, $request->token));
            return response()->json(['message' => 'OTP sent'], 200);
        } else {
            return response()->json(['message' => 'Invalid token'], 401);
        }
    }


    //check if email exists for forgot password and send otp
    public function checkemail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);
        $user = User::where('email', $request->email)->first();
        if ($user) {
            $otp = random_int(100000, 999999);
            $token_otp = Str::random(64);
            Cache::put("otp:{$user->email}", ['email' => $user->email, 'otp' => $otp], now()->addMinutes(5));
            Mail::to($user->email)->send(new OTPMail($user->email, $otp,  $token_otp));
            return response()->json(['message' => 'تم إرسال رمز تحقق إلى بريدك الإلكتروني'], 200);
        }
        return response()->json(['message' => 'رجاء تأكد من البريد إلكتروني'], 401);

    }
    //verify otp after check email
    public function verify(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|string',
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            return response()->json([$validator->errors(),
                'message' => "معلومات غير صالحة",
            ], 422);
        }

        $cache = Cache::get("otp:{$request->email}");
        if ($cache) {
            if ($request->otp == $cache['otp']) {
                Cache::forget("otp:{$request->token}");
                $token_otp = Str::random(64);
                Cache::put("otp:{$request->email}", [ 'otp' => $token_otp], now()->addMinutes(5));
                return response()->json([
                    'message' => 'OTP verified',
                    'token' => $token_otp,
                ], 200);
            }
        } else {
            return response()->json(['message' => 'Invalid OTP'], 401);
        }
        return response()->json(['message' => 'Invalid OTP'], 401);
    }

    //forget password (update password without login but after check email and verify otp)
    public function forgetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email', // Ensure user_id is provided and valid
            'newPassword' => 'required|string|min:8',       // Validate the new password
            'token' => 'required',
        ]);
        $user = User::where('email',$request->email)->first();
        $cache = Cache::get("otp:{$request->email}");

        if ($cache) {
            if ($cache['otp'] == $request->token) {
                $user->password = Hash::make($request->newPassword);
                $user->save();
                Cache::forget("otp:{$request->email}");
                return response()->json(['message' => 'Password changed successfully']);
            }
            return response()->json(['message' => 'Invalid '], 401);
        }
        return response()->json(['message' => 'Invalid '], 401);
    }

    public function customers(){
        $customers = User::select('id','first_name','last_name')->where('role','customer')->get();
        $customers = $customers->map(function($customer){
            return[
                'value'=>$customer->id,
                'lable'=>$customer->getFullNameAttribute()
            ];
        });
        return response()->json($customers);
    }

}
