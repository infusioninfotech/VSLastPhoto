VSLastPhoto
============


VSLastPhoto is a simple wrapper class that you can use to get the last photo from the Camera Roll. 


Installation
============


Add VSLastPhoto.h and VSLastPhoto.m to your project.


Usage
=====


```
VSLastPhoto *lastPhoto = [[VSLastPhoto alloc] init];
        
[lastPhoto getLastPhoto:self.mainImage.bounds.size completion:^(UIImage *image) {
    [self.mainImage setImage:image];
}];
```

