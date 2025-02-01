<?php

namespace App\Http\Controllers;

use App\Models\CommUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserManagementController extends Controller {
    public function index() {
        $users = User::select('id', 'first_name', 'father_name', 'last_name', 'username', 'email', 'role', 'phone')->get();
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
            'commission_id' => ['required', 'array'],
            'commission_id.*' => ['integer', 'exists:commissions,id'],
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
        foreach ($request->commission_id as $commission_id) {
            $commission = new CommUser;
            $commission->user_id = $user->id;
            $commission->commission_id = $commission_id;
            $commission->save();
        }

        return response()->json(['success' => true], 201);
    }

    public function getUser($userId) {
        $user = User::find($userId);
        return response()->json($user);
    }

    public function editUser(Request $request, $userId) {
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
            'email.unique' => 'The email has already been taken.',
            'email.email' => 'The email must be a valid email address.',
            'phone.regex' => 'The phone field must be a valid phone number.',
            'phone.max' => 'The phone field may not be greater than 10 characters.',

        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }
        $user = User::findOrFail($userId);
        $user->update($validator->getData());
        return response()->json(['success' => true, 'user' => $user]);
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
        if (!$token = JWTAuth::fromUser($user)) {

            return response()->json([
                "success" => false,
                'message' => "خطأ اثناء انشاء token",
            ], (500));

        }

        $tokenTTL = JWTAuth::factory()->getTTL();

//        $otp = random_int(100000, 999999);
//        $token_otp = Str::random(64);
//        Cache::put("otp:{$token_otp}", ['email' => $request->email, 'otp' => $otp], now()->addMinutes(5));
//        Mail::to($request->email)->send(new OTPMail($request->email, $otp,  $token_otp));
        return response()->json([
            "access" => $token,
            'type' => $user->role,
            'refresh' => '',
            'token_expiration' => $tokenTTL,
        ]);
        //return response()->json(['success' => true, 'access_token' => $token, 'token_type' => 'Bearer', 'user' => $user]);
    }
}
