package ojhgdsingle.action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import ojhgdsingle.action.Action;
import ojhgdsingle.action.ActionForward;

public class PictureAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
						HttpServletResponse response) throws Exception {
		   String path = request.getServletContext().getRealPath("") 
		                + "main/member/picture/";
		   String fname = null;
		   File f = new File(path);
		   if(!f.exists()) {   f.mkdirs();   }
		   MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
		   fname = multi.getFilesystemName("picture");
		   BufferedImage bi = ImageIO.read(new File(path + fname));
		   int width = bi.getWidth()/3; 
		   int height = bi.getHeight()/3; 
		   BufferedImage thumb = new BufferedImage
				   (width,height,BufferedImage.TYPE_INT_RGB);
		   Graphics2D g = thumb.createGraphics();
		   g.drawImage(bi,0,0,width,height,null);
		   f = new File(path + "sm_" +fname);
		   ImageIO.write(thumb,"jpg",f);
		   request.setAttribute("fname", fname);
		   return new ActionForward();
	}
}
