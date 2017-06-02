package services.impl;

import org.springframework.stereotype.Service;
import services.DemoService;

/**
 * Created by lixulong on 2017/5/31.
 */
@Service("demoService")
public class DemoServiceImpl implements DemoService {
    @Override
    public String getDemoService(){

        return "getDemoService";
    }
}
