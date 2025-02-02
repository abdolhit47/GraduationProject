<?php

namespace App\Http\Controllers;

use App\Models\Commission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use function PHPSTORM_META\map;

class CommissionsManagementController extends Controller {

    public function addCommission(Request $request) {
        $validator = Validator::make($request->all(), [
            'country' => ['required', 'string'],
            'commission' => ['required', 'decimal', 'min:0', 'max:1000000'],
            'price_per_kg' => ['required', 'decimal', 'min:0', 'max:1000000'],

        ], [
            'country.required' => 'Country is required.',
            'commission.required' => 'Commission amount is required.',
            'commission.decimal' => 'Commission amount must be a number.',
            'price_per_kg.required' => 'price_per_kg is required.',
            'price_per_kg.decimal' => 'price_per_kg must be a number.',
        ]);
        if($validator->fails()){
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
            ], 400);
        }

        Commission::create($request->all());
        return response()->json([
            'status' => 'success',
            'message' => 'Commission added successfully',
        ]);
    }

    public function viewCommissions(Request $request) {
        $commissions = Commission::all();
        $commissions = $commissions->map(function($commission){
            return [
                'id' => $commission->id,
                'country' => $commission->country,
                'commission' => $commission->commission,
                'price_per_kg' => $commission->price_per_kg,
            ];
        });
        return response()->json([
            'status' => 'success',
            'data' => $commissions,
        ]);
    }

    public function editCommission(Request $request, $commissionId) {
        $validator = Validator::make($request->all(), [
            'country' => [ 'nullable','string'],
            'commission' => [ 'nullable','numeric', 'min:0', 'max:1000000'],
            'price_per_kg' => [ 'nullable','numeric', 'min:0', 'max:1000000'],

        ], [
            'country.string' => 'Country is string.',
            'commission.decimal' => 'Commission amount must be a number.',
            'price_per_kg.decimal' => 'price_per_kg must be a number.',
        ]);
        if($validator->fails()){
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors(),
            ], 400);
        }
        $commission = Commission::findOrFail($commissionId);


        if (!$commission) {
            return response()->json([
                'status' => 'error',
                'message' => 'Commission not found',
            ], 404);
        }

        $commission->update($validator->validated());
//        dd($commission);
        return response()->json([
            'status' => 'success',
            'message' => 'Commission updated successfully',
        ]);
    }

    public function deleteCommission($commissionId) {
        $commission = Commission::findOrFail($commissionId);
        $commission->delete();
        return $this->successResponse(null, 'Commission deleted successfully');
    }

}
