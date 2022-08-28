package karate.request.user;

import com.intuit.karate.junit5.Karate;
public class CreateUserRunner {
    @Karate.Test
    Karate createUser(){
        return Karate.run("classpath:karate/features/user/createUser.feature").relativeTo(getClass());
    }
}
