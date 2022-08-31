package karate.request.user.loginUser;

import com.intuit.karate.junit5.Karate;
public class LoginUser {
    @Karate.Test
    Karate loginUser(){
        return Karate.run("classpath:karate/features/user/2.loginUser/loginUser.feature").relativeTo(getClass());
    }
}

