<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $primaryKey = 'orderid'; 
    public $incrementing = true;       
    public $timestamps = false;       

    protected $fillable = [
        'mid',             // menu id
        'quantity',        // quantity of item
        'ordertime',       // order date/time
        'id',              // user id 
        'payment',         // payment type
        'billingaddress',  // billing address
        'phonenumber',      // phone number
        'ordernumber'  // unique order number / batch id
    ];
}