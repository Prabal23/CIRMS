<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
class UserQuery {
   
    public function getAll(){
       $user = User::all();
       return $user;
    }
    
}
