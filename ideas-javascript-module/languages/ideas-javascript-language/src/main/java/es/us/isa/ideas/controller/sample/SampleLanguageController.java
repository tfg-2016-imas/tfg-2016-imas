package es.us.isa.ideas.controller.sample;

import es.us.isa.ideas.module.common.AppResponse;
import es.us.isa.ideas.module.common.AppResponse.Status;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import es.us.isa.ideas.module.controller.BaseLanguageController;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
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
            ScriptEngineManager manager = new ScriptEngineManager();
            ScriptEngine engine = manager.getEngineByName("js");
            
            Object result = null;
            try {
                result = engine.eval(content);
            } catch (ScriptException ex) {
                Logger.getLogger(SampleLanguageController.class.getName()).log(Level.SEVERE, null, ex);
            }
            appResponse.setHtmlMessage(result.toString());
            appResponse.setStatus(Status.OK);
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
