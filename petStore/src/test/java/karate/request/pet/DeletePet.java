package karate.request.pet;

import com.intuit.karate.junit5.Karate;
public class DeletePet {
    @Karate.Test
    Karate DeletePet(){
        return Karate.run("classpath:karate/features/pet/zdeletePet.feature").relativeTo(getClass());
    }
}
