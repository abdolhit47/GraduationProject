<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{

    public function index() {
        $user = User::find(Auth::user()->id);
        $notifications = $user->notifications->map(function ($notification) {
            return [
                    'id' => $notification->data['model_id'],
                    'data' => $notification->data['data'],
                    'type' => class_basename($notification->data['model_type'])
            ];
        });
        return response()->json($notifications, 200);
    }
}
