package karate.request;

import com.intuit.karate.junit5.Karate;
public class DeletePet {
    @Karate.Test
    Karate DeletePet(){
        return Karate.run("classpath:karate/features/deletePet.feature").relativeTo(getClass());
    }
}
