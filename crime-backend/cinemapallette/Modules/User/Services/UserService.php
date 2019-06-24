<?php
namespace Modules\User\Services;
use App\User;
use App\Classes\CommonClass;
use Illuminate\Http\Request;
use Modules\User\Query\UserQuery;

class UserService {
    protected $query;
    protected $customhelper;
    public function __construct(UserQuery $query, CommonClass $customhelper){
        $this->query = $query;
        $this->customhelper = $customhelper;
    }
    public function test(){
       $user = $this->query->getAll();
       \Log::info($user);
    }


} 