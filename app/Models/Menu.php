<?php

namespace App\Models;
<<<<<<< HEAD
=======

>>>>>>> 9eb146a (update files)
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
<<<<<<< HEAD
 
    use HasFactory;
=======
    use HasFactory;

>>>>>>> 9eb146a (update files)
    protected $table = 'menu';
    protected $primaryKey = 'mid';
    public $timestamps = false;

    protected $fillable = [
        'mtid',
        'name',
        'price',
        'image',
    ];
}


