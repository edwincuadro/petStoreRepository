package karate.request.user;

import com.intuit.karate.junit5.Karate;
public class LoginUser {
    @Karate.Test
    Karate loginUser(){
        return Karate.run("classpath:karate/features/user/loginUser.feature").relativeTo(getClass());
    }
}

