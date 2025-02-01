<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class AuthRoute
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next,...$permission): Response
    {
//        dd($permission);
        if(!Auth::user()->role == 'general_manager') {
            return response()->json(['error' => 'ليس لديك الصلاحية للوصول إلى هذه الصفحة.'], 403);
        }
        return $next($request);
    }
}
