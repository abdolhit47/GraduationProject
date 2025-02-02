<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class AuthRoute
{
    public function handle(Request $request, Closure $next,...$permission): Response
    {//dd($permission);
        if(Auth::user()->role == 'manager') {
            return response()->json(['error' => 'ليس لديك الصلاحية للوصول إلى هذه الصفحة.'], 403);
        }
        return $next($request);
    }
}
