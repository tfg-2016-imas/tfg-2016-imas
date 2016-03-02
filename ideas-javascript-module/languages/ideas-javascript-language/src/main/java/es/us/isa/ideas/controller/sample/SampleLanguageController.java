package es.us.isa.ideas.controller.sample;

import es.us.isa.ideas.module.common.AppResponse;
import es.us.isa.ideas.module.common.AppResponse.Status;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import es.us.isa.ideas.module.controller.BaseLanguageController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/language")
public class SampleLanguageController extends BaseLanguageController {

    @RequestMapping(value = "/operation/{id}/execute", method = RequestMethod.POST)
    @ResponseBody
    @Override
    public AppResponse executeOperation(String id, String content, String fileUri, String auxArg0) {

        AppResponse appResponse = new AppResponse();
        appResponse.setFileUri(fileUri);

        if (id.equals("test")) {
            String key = "hello world";
            if (content.toLowerCase().contains(key)) {
                appResponse.setHtmlMessage("<pre><b>This is a valid document.</b></pre>");
                appResponse.setStatus(Status.OK);
            } else {
                appResponse.setHtmlMessage("<pre><b>This is an invalid document.</b><br>Please, add the string \"" + key + "\" to validate your document.</pre>");
                appResponse.setStatus(Status.OK_PROBLEMS);
            }
        }

        return appResponse;
    }

    @RequestMapping(value = "/format/{format}/checkLanguage", method = RequestMethod.POST)
    @ResponseBody
    @Override
    public AppResponse checkLanguage(String id, String content, String fileUri) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @RequestMapping(value = "/convert", method = RequestMethod.POST)
    @ResponseBody
    @Override
    public AppResponse convertFormat(String currentFormat, String desiredFormat, String fileUri, String content) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

}
