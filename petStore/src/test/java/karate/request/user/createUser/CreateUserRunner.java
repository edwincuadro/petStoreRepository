package karate.request.user.createUser;

import com.intuit.karate.junit5.Karate;
public class CreateUserRunner {
    @Karate.Test
    Karate createUser(){
        return Karate.run("classpath:karate/features/user/1.createUser/createUser.feature").relativeTo(getClass());
    }
}
