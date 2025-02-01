<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class ProfileSettingsController extends Controller {
    public function getProfile() {
        $user = User::findOrFail(Auth::id())->load(['roles', 'permissions']);
        return $this->successResponse($user, 'Profile retrieved successfully');
    }

    public function updateProfile(Request $request) {
        $user = User::findOrFail(Auth::id());

        $request->validate([
            'name' => ['sometimes', 'string', 'max:255', 'regex:/^[a-zA-Z\s\-\']+$/'],
            'email' => ['sometimes', 'email:rfc,dns', Rule::unique('users')->ignore($user->id)],
            'phone' => ['sometimes', 'string', 'regex:/^([0-9\s\-\+\(\)]*)$/', 'min:10', 'max:20'],
            'address' => ['sometimes', 'array'],
            'address.street' => ['required_with:address', 'string', 'max:255'],
            'address.city' => ['required_with:address', 'string', 'max:100'],
            'address.state' => ['required_with:address', 'string', 'max:100'],
            'address.country' => ['required_with:address', 'string', 'max:100'],
            'address.postal_code' => ['required_with:address', 'string', 'max:20'],
            'profile_image' => ['nullable', 'image', 'mimes:jpeg,png,jpg', 'max:2048'],
            'birth_date' => ['sometimes', 'date', 'before:today'],
            'gender' => ['sometimes', Rule::in(['male', 'female', 'other', 'prefer_not_to_say'])],
            'language' => ['sometimes', 'string', 'max:10'],
            'timezone' => ['sometimes', 'string', 'timezone'],
            'notification_preferences' => ['sometimes', 'array'],
            'notification_preferences.email' => ['boolean'],
            'notification_preferences.push' => ['boolean'],
            'notification_preferences.sms' => ['boolean'],
            'emergency_contact' => ['sometimes', 'array'],
            'emergency_contact.name' => ['required_with:emergency_contact', 'string', 'max:255'],
            'emergency_contact.relationship' => ['required_with:emergency_contact', 'string', 'max:50'],
            'emergency_contact.phone' => ['required_with:emergency_contact', 'string', 'regex:/^([0-9\s\-\+\(\)]*)$/', 'min:10', 'max:20'],
            'emergency_contact.email' => ['nullable', 'email:rfc,dns']
        ], [
            'name.regex' => 'Name can only contain letters, spaces, hyphens and apostrophes.',
            'email.unique' => 'This email is already taken.',
            'phone.regex' => 'Please enter a valid phone number.',
            'profile_image.max' => 'Profile image must not exceed 2MB.',
            'birth_date.before' => 'Birth date must be a date before today.',
            'emergency_contact.phone.regex' => 'Please enter a valid emergency contact phone number.'
        ]);

        // Handle profile image
        if ($request->hasFile('profile_image')) {
            // Delete old profile image if exists
            if ($user->profile_image) {
                Storage::disk('public')->delete($user->profile_image);
            }

            $path = $request->file('profile_image')->store('profile_images', 'public');
            $user->profile_image = $path;
        }

        // Update user information
        $user->fill($request->except('profile_image'));
        
        // Log profile update
        $user->profile_update_history = array_merge($user->profile_update_history ?? [], [[
            'updated_at' => now(),
            'updated_by' => $user->id,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent(),
            'changed_fields' => array_keys($request->except(['profile_image']))
        ]]);

        $user->save();

        return $this->successResponse($user, 'Profile updated successfully');
    }

    public function updateNotificationPreferences(Request $request) {
        $request->validate([
            'preferences' => ['required', 'array'],
            'preferences.email' => ['required', 'array'],
            'preferences.email.*' => ['boolean'],
            'preferences.push' => ['required', 'array'],
            'preferences.push.*' => ['boolean'],
            'preferences.sms' => ['required', 'array'],
            'preferences.sms.*' => ['boolean']
        ]);

        $user = User::findOrFail(Auth::id());
        $user->notification_preferences = $request->preferences;
        
        // Log notification preferences update
        $user->notification_update_history = array_merge($user->notification_update_history ?? [], [[
            'updated_at' => now(),
            'updated_by' => $user->id,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ]]);

        $user->save();

        return $this->successResponse($user->notification_preferences, 'Notification preferences updated successfully');
    }

    public function updatePrivacySettings(Request $request) {
        $request->validate([
            'settings' => ['required', 'array'],
            'settings.profile_visibility' => ['required', Rule::in(['public', 'private', 'contacts_only'])],
            'settings.show_email' => ['required', 'boolean'],
            'settings.show_phone' => ['required', 'boolean'],
            'settings.show_address' => ['required', 'boolean'],
            'settings.allow_messages' => ['required', Rule::in(['everyone', 'contacts_only', 'none'])],
            'settings.show_online_status' => ['required', 'boolean']
        ]);

        $user = User::findOrFail(Auth::id());
        $user->privacy_settings = $request->settings;
        
        // Log privacy settings update
        $user->privacy_update_history = array_merge($user->privacy_update_history ?? [], [[
            'updated_at' => now(),
            'updated_by' => $user->id,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ]]);

        $user->save();

        return $this->successResponse($user->privacy_settings, 'Privacy settings updated successfully');
    }

    public function deleteAccount(Request $request) {
        $request->validate([
            'password' => ['required', 'string'],
            'reason' => ['required', 'string', 'max:1000']
        ]);

        $user = User::findOrFail(Auth::id());

        if (!Hash::check($request->password, $user->password)) {
            return $this->errorResponse('Invalid password.', 422);
        }

        // Log account deletion
        $user->account_deletion_info = [
            'deleted_at' => now(),
            'reason' => $request->reason,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ];

        // Soft delete the user
        $user->save();
        $user->delete();

        Auth::logout();

        return $this->successResponse(null, 'Account deleted successfully');
    }

    public function exportUserData(Request $request) {
        $user = User::findOrFail(Auth::id());

        $userData = [
            'profile' => $user->toArray(),
            'activity_history' => [
                'login_history' => $user->login_history,
                'profile_updates' => $user->profile_update_history,
                'notification_updates' => $user->notification_update_history,
                'privacy_updates' => $user->privacy_update_history
            ],
            'preferences' => [
                'notifications' => $user->notification_preferences,
                'privacy' => $user->privacy_settings
            ],
            'export_info' => [
                'exported_at' => now(),
                'ip_address' => $request->ip(),
                'user_agent' => $request->userAgent()
            ]
        ];

        // Log data export
        $user->data_export_history = array_merge($user->data_export_history ?? [], [[
            'exported_at' => now(),
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent()
        ]]);
        $user->save();

        return $this->successResponse($userData, 'User data exported successfully');
    }
}
