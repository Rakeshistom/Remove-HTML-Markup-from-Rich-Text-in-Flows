public class RemoveHtmlMarkup{
    
    @InvocableMethod(Label='Removes HTML markup and returns plain text')
    public static List<String> stripHtmlTags(List<String> richText) {
        
        List<String> textContent  = new List<String>(); 
        for (string s : richText) {
            textContent.add(s.stripHtmlTags());
        }
        return textContent;
    }
}