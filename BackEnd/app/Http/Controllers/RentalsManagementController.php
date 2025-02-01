<?php

namespace App\Http\Controllers;

use App\Models\Rental;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class RentalsManagementController extends Controller {
    public function addRental(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required','string','max:255',
            'type' => ['required', 'string', Rule::in(['apartment', 'office', 'building', 'warehouse', 'storage', 'other'])],//نوع المنتج
            'location' => 'required','string','max:255',
            'amount' => 'required','numeric','min:0',
        ], [
            'name.required' => 'Name is required.',
            'name.string' => 'Name must be a string.',
            'type.required' => 'Type is required.',
            'type.string' => 'Type must be a string.',
            'type.in' => 'Type must be one of the following: apartment, office, building, warehouse, storage, other.',
            'location.required' => 'Location is required.',
            'location.string' => 'Location must be a string.',
            'amount.required' => 'Amount is required.',
            'amount.numeric' => 'Amount must be a number.',
            'amount.min' => 'Amount must be greater than 0.',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 400);
        }
        $rental = Rental::create($validator->validated());
        return response()->json([
            'success' => true,
            'rental' => $rental
        ], 201);
    }

    public function viewRentals(Request $request) {
        $rentals = Rental::select('id', 'name', 'type', 'location', 'amount')->get();
        return response()->json($rentals);
    }

    public function editRental(Request $request, $rentalId) {
        $rental = Rental::findOrFail($rentalId);

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes','string','max:255',
            'type' => ['sometimes', 'string', Rule::in(['apartment', 'office', 'building', 'warehouse', 'storage', 'other'])],//نوع المنتج
            'location' => 'sometimes','string','max:255',
            'amount' => 'sometimes','numeric','min:0',
        ], [
            'name.string' => 'Name must be a string.',
            'type.string' => 'Type must be a string.',
            'type.in' => 'Type must be one of the following: apartment, office, building, warehouse, storage, other.',
            'location.string' => 'Location must be a string.',
            'amount.numeric' => 'Amount must be a number.',
            'amount.min' => 'Amount must be greater than 0.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 400);
        }

        $rental->update($request->all());
        return response()->json([
            'success' => true,
            'rental' => $rental
        ]);
    }

    public function deleteRental(Request $request, $rentalId) {
        $rental = Rental::findOrFail($rentalId);
        $rental->delete();

        return response()->json([
            'success' => true,
            'message' => 'Rental deleted successfully'
        ]);
    }

    public function updateRentalStatus(Request $request, $rentalId) {
        $request->validate([
            'status' => ['required', Rule::in(['pending', 'active', 'completed', 'cancelled'])],
        ]);

        $rental = Rental::findOrFail($rentalId);
        $rental->status = $request->status;

        $rental->save();

        return response()->json([
            'success' => true,
            'message' => 'Rental status updated successfully',
            'rental' => $rental
        ]);
    }

    public function getRentalsSummary(Request $request) {
        $query = Rental::query();

        if ($request->has('date_from')) {
            $query->where('start_date', '>=', $request->date_from);
        }

        if ($request->has('date_to')) {
            $query->where('end_date', '<=', $request->date_to);
        }

        $summary = $query->selectRaw('status, COUNT(*) as count, SUM(total_cost) as total_amount')
                        ->groupBy('status')
                        ->get();

        return response()->json([
            'success' => true,
            'summary' => $summary
        ]);
    }
}
