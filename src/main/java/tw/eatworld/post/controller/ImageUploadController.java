package tw.eatworld.post.controller;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.eatworld.post.model.ImageUploadVo;

@RestController
@RequestMapping("/imag")
public class ImageUploadController {

    private final String imageFilePath = "D:/upload/";

    /**
     * 上传图片
     *
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping("/ckeditorUpload")
    public ImageUploadVo ckeditorUpload(@RequestParam("upload") MultipartFile file) throws Exception {
        System.out.println("開始上傳圖片");
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString() + suffixName;
        System.out.println("上傳圖片名稱：{}"+newFileName);
        System.out.println("上傳圖片大小：{}" + file.getSize());
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imageFilePath + newFileName));

        ImageUploadVo imageUploadVo = new ImageUploadVo();
        imageUploadVo.setUploaded(1);
        imageUploadVo.setFileName(newFileName);
        imageUploadVo.setUrl("http://localhost:8080/EatWorld/photo/" + newFileName);
        return imageUploadVo;
    }

}
