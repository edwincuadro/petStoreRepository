package karate.request;

import com.intuit.karate.junit5.Karate;
public class FindPetByIdRunner {
    @Karate.Test
    Karate FindPetById(){
        return Karate.run("classpath:karate/features/findPetById.feature").relativeTo(getClass());
    }
}
