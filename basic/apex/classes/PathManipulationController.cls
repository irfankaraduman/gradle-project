public with sharing class PathManipulationController {
	public String resourceName { get; set; }
    public String resourceUrl { get; set; }

    public ApexPages.Action findResource() {
        resourceUrl = PageReference.forResource(resourceName).getUrl();
    }
}