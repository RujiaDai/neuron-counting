file<-list.files(getwd(),full.names=T)

prop<-c(0.11,0.43,0.06,0.40)
system.time(

for(i in 1:length(file)){

image<-image_read(file[[i]])
height<-image_info(image)[[3]]
width<-image_info(image)[[2]]
parameter(width,height,prop)

crop_size<-read.table('parameter.txt',header=F,sep='\t')

output1<-image_crop(image,crop_size[1,1], repage = FALSE)
output2<-image_crop(image,crop_size[1,2], repage = FALSE)
output3<-image_crop(image,crop_size[1,3], repage = FALSE)
output4<-image_crop(image,crop_size[1,4], repage = FALSE)

image_write(output1, path = paste0(file[[i]],"_layer1.tiff"), format = "tiff")
image_write(output2, path = paste0(file[[i]],"_layer2_3.tiff"), format = "tiff")
image_write(output3, path = paste0(file[[i]],"_layer4.tiff"), format = "tiff")
image_write(output4, path = paste0(file[[i]],"_layer5_6.tiff"), format = "tiff")

}
)