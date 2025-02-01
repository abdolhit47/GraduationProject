<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rules\Password;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Str;

/**
 * كنترولر إدارة تسجيل الدخول والمصادقة
 * يتعامل مع عمليات تسجيل الدخول، تسجيل الخروج، وإدارة الجلسات
 */
class LoginController extends Controller {
    /**
     * تسجيل دخول المستخدم
     * 
     * @param Request $request طلب HTTP يحتوي على بيانات تسجيل الدخول
     * @return JsonResponse استجابة تحتوي على token المستخدم في حالة نجاح تسجيل الدخول
     */
    public function login(Request $request) {
        $request->validate([
            'email' => ['required', 'email:rfc,dns'],
            'password' => ['required', 'string', 'min:8'],
            'device_name' => ['nullable', 'string', 'max:255'],
            'remember_me' => ['boolean']
        ], [
            'email.required' => 'Email address is required.',
            'email.email' => 'Please enter a valid email address.',
            'password.required' => 'Password is required.',
            'password.min' => 'Password must be at least 8 characters.'
        ]);

        $credentials = $request->only('email', 'password');
        
        if (!Auth::attempt($credentials, $request->remember_me)) {
            return $this->errorResponse('Invalid credentials.', 401);
        }

        $user = User::findOrFail(Auth::id());
        $token = JWTAuth::fromUser($user);

        // Log login activity
        $user->login_history = array_merge($user->login_history ?? [], [[
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent(),
            'device_name' => $request->device_name,
            'timestamp' => now()
        ]]);
        $user->save();

        return $this->successResponse([
            'token' => $token,
            'token_type' => 'bearer',
            'expires_in' => config('jwt.ttl') * 60,
            'user' => $user
        ], 'Login successful');
    }

    /**
     * تسجيل خروج المستخدم
     * 
     * @param Request $request طلب HTTP
     * @return JsonResponse رسالة نجاح تسجيل الخروج
     */
    public function logout(Request $request) {
        Auth::logout();
        return $this->successResponse(null, 'Successfully logged out');
    }

    /**
     * تحديث token المستخدم
     * 
     * @return JsonResponse token جديد في حالة نجاح التحديث
     */
    public function refresh() {
        try {
            $token = JWTAuth::parseToken()->refresh();
            return $this->successResponse([
                'token' => $token,
                'token_type' => 'bearer',
                'expires_in' => config('jwt.ttl') * 60
            ], 'Token refreshed successfully');
        } catch (\Exception $e) {
            return $this->errorResponse('Could not refresh token.', 401);
        }
    }

    /**
     * الحصول على معلومات المستخدم الحالي
     * 
     * @return JsonResponse بيانات المستخدم المسجل حالياً
     */
    public function me() {
        try {
            $user = Auth::user();
            return $this->successResponse($user, 'User information retrieved successfully');
        } catch (\Exception $e) {
            return $this->errorResponse('Unauthorized.', 401);
        }
    }

    /**
     * تغيير كلمة المرور للمستخدم
     * 
     * @param Request $request طلب HTTP يحتوي على كلمة المرور القديمة والجديدة
     * @return JsonResponse رسالة نجاح تغيير كلمة المرور
     */
    public function changePassword(Request $request) {
        $request->validate([
            'current_password' => ['required', 'string'],
            'new_password' => ['required', 'string', 'confirmed', Password::min(8)
                ->mixedCase()
                ->numbers()
                ->symbols()
                ->uncompromised()
            ],
            'new_password_confirmation' => ['required', 'string']
        ], [
            'current_password.required' => 'Current password is required.',
            'new_password.required' => 'New password is required.',
            'new_password.confirmed' => 'Password confirmation does not match.',
            'new_password.min' => 'Password must be at least 8 characters.',
            'new_password.mixed' => 'Password must contain both uppercase and lowercase letters.',
            'new_password.numbers' => 'Password must contain at least one number.',
            'new_password.symbols' => 'Password must contain at least one symbol.',
            'new_password.uncompromised' => 'This password has been exposed in data leaks. Please choose a different password.'
        ]);

        $user = User::findOrFail(Auth::id());

        if (!Hash::check($request->current_password, $user->password)) {
            return $this->errorResponse('Current password is incorrect.', 422);
        }

        if (Hash::check($request->new_password, $user->password)) {
            return $this->errorResponse('New password cannot be the same as current password.', 422);
        }

        $user->password = Hash::make($request->new_password);
        $user->password_changed_at = now();
        
        // Log password change
        $user->password_history = array_merge($user->password_history ?? [], [[
            'changed_at' => now(),
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ]]);
        
        $user->save();

        return $this->successResponse(null, 'Password changed successfully');
    }

    public function forgotPassword(Request $request) {
        $request->validate([
            'email' => ['required', 'email:rfc,dns', 'exists:users,email']
        ], [
            'email.required' => 'Email address is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.exists' => 'No account found with this email address.'
        ]);

        // Generate password reset token
        $token = Str::random(60);
        
        // Store token with expiration
        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => Hash::make($token),
            'created_at' => now()
        ]);

        // Send password reset email
        // Add your email sending logic here

        return $this->successResponse(null, 'Password reset instructions have been sent to your email');
    }

    public function resetPassword(Request $request) {
        $request->validate([
            'token' => ['required', 'string'],
            'email' => ['required', 'email:rfc,dns', 'exists:users,email'],
            'password' => ['required', 'string', 'confirmed', Password::min(8)
                ->mixedCase()
                ->numbers()
                ->symbols()
                ->uncompromised()
            ],
            'password_confirmation' => ['required', 'string']
        ]);

        // Verify token
        $resetRecord = DB::table('password_resets')
            ->where('email', $request->email)
            ->first();

        if (!$resetRecord || !Hash::check($request->token, $resetRecord->token)) {
            return $this->errorResponse('Invalid password reset token.', 422);
        }

        // Check if token is expired (24 hours)
        if (now()->diffInHours($resetRecord->created_at) > 24) {
            return $this->errorResponse('Password reset token has expired.', 422);
        }

        $user = User::where('email', $request->email)->firstOrFail();
        
        if (!$user) {
            return $this->errorResponse('User not found.', 404);
        }

        $user->fill($request->only([
            'name',
            'email',
            'phone'
        ]));
        
        $user->password = Hash::make($request->password);
        $user->password_changed_at = now();
        
        // Log password reset
        $user->password_history = array_merge($user->password_history ?? [], [[
            'reset_at' => now(),
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ]]);
        
        $user->save();

        // Delete used token
        DB::table('password_resets')
            ->where('email', $request->email)
            ->delete();

        return $this->successResponse(null, 'Password has been reset successfully');
    }

    public function updateDeviceToken(Request $request) {
        $request->validate([
            'device_token' => ['required', 'string', 'max:255'],
            'device_type' => ['required', 'in:ios,android,web'],
        ]);

        $user = User::findOrFail(Auth::id());
        $user->device_token = $request->device_token;
        $user->device_type = $request->device_type;
        $user->save();

        return $this->successResponse(null, 'Device token updated successfully');
    }
}
