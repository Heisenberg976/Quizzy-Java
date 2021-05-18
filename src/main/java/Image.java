import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Image {
    public static void resize(String inputImagePath, String outputImagePath, int scaledWidth, int scaledHeight)
            throws IOException {
        // reads input image
        File inputFile = new File(inputImagePath);
        BufferedImage inputImage = ImageIO.read(inputFile);

        // creates output image
        BufferedImage outputImage = new BufferedImage(scaledWidth,
                scaledHeight, inputImage.getType());

        // scales the input image to the output image
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();

        // extracts extension of output file
        String formatName = outputImagePath.substring(outputImagePath
                .lastIndexOf(".") + 1);

        // writes to output file
        ImageIO.write(outputImage, formatName, new File(outputImagePath));
        System.out.println("done");
    }

    public static void watermark() {

        try {
            File folder = new File("C:\\Users\\User\\OneDrive\\Desktop\\Business\\fb\\new\\");
            File[] files = folder.listFiles();
            if (files != null) {
                for (int i = 0; i < files.length; i++) {
                    BufferedImage sourceImage = ImageIO.read(files[i]);
                    BufferedImage watermarkImage = ImageIO.read(new File("C:\\Users\\User\\OneDrive\\Desktop\\Business\\fb\\water.png"));

                    // initializes necessary graphic properties
                    Graphics2D g2d = (Graphics2D) sourceImage.getGraphics();
                    AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f);
                    g2d.setComposite(alphaChannel);

                    // calculates the coordinate where the image is painted
                    int topLeftX = 0;
                    int topLeftY = 0;

                    // paints the image watermark
                    g2d.drawImage(watermarkImage, topLeftX, topLeftY, null);

                    ImageIO.write(sourceImage, "png", new File("C:\\Users\\User\\OneDrive\\Desktop\\Business\\fb\\new\\" + files[i].getName()));
                    g2d.dispose();

                    System.out.println("Added");

                }
            }

        } catch (IOException ex) {
            System.err.println(ex);
        }
    }





    // File watermarkImageFile, File sourceImageFile, File destImageFile
    public static void main(String[] args) throws IOException {
        watermark();
    }
}


