@isTest
public class RemoveHtmlMarkup_Test {
    
    @isTest
    static void stripHtmlTags() {
        
        List<string> removeHTML = New List<String>{'<html><body>This is a Test</body></html>'};
        List<string> withoutHTML = New List<String>{'This is a Test'};

        System.assertEquals(withoutHTML, RemoveHtmlMarkup.stripHtmlTags(removeHTML));		
    }
}
