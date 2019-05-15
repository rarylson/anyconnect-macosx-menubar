Cisco AnyConnect MacOS X Menubar
================================

Pretty MacOS X menu bar assets for Cisco AnyConnect Security Mobility Client (for both normal and dark modes).

Do you use Cisco AnyConnect in your MacOS and don't like its menu bar icons? Do you think that it looks awful when compared to the other icons? Now, you can change this!

Here are some assets that can be used to replace the native item.

![Before/After](readme_images/before_after.png)

Install
-------

To install, you only have to:

- Download the [assets in `Resources.zip`](https://github.com/rarylson/anyconnect-macosx-menubar/raw/master/Resources.zip);
- Unzip these files;
- Open Finder and Find `Cisco AnyConnect Secure Mobility Client.app`. It's probably in `/Applications/Cisco`;
- Right-click the application and select "Show Package Contents";
- Open the `Contents` folder, and the `Resources` folder;
- Drag the new image files into the `Resources` folder;
    - You may need to authenticate with your password;
- Quit Cisco AnyConnect and open it again.

#### Dark mode

Download the [assets in `Resources-Dark.zip`](https://github.com/rarylson/anyconnect-macosx-menubar/raw/master/Resources-Dark.zip) instead and execute the other steps.

### Install using terminal

- Download the assets in `Resources.zip`:
    ```sh
    wget https://github.com/rarylson/cisco-anyconnect-macos-toolbar/raw/master/Resources.zip
    ```
- Assuming that your Cisco AnyConnect Secure Mobility Client app is in `/Applications/Cisco`, and you've downloaded `Resources.zip` to the current directory, you can just run:
    ```sh
    sudo unzip -d '/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app/Contents/Resources/' Resources.zip
    ```

#### Dark mode

- Download the assets in `Resources-Dark.zip`:
    ```sh
    wget https://github.com/rarylson/cisco-anyconnect-macos-toolbar/raw/master/Resources-Dark.zip
    ```
- Assuming that your Cisco AnyConnect Secure Mobility Client app is in `/Applications/Cisco`, and you've downloaded `Resources-Dark.zip` to the current directory, you can just run:
    ```sh
    sudo unzip -d '/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app/Contents/Resources/' Resources-Dark.zip
    ```

### Caveats

- This doesn't change the software, it just puts some more images in the application's resource folder. If you plan on switching back to the previous menu bar icons, just delete the new images.

License
-------

This project is released under the [Revised BSD License](LICENSE).

Thanks to
---------

This project is based on:

- [Project anyconnect-dark, by leebyron](https://github.com/leebyron/anyconnect-dark/blob/master/README.md);
    - Idea and instructions;
- [iconscout.com - Cisco anyconnect Icon](https://iconscout.com/icon/cisco-anyconnect);
    - The main icon itself.

References
----------

- [developer.apple.com - Human Interface Guidelines - Menu Bar Extras](https://developer.apple.com/design/human-interface-guidelines/macos/extensions/menu-bar-extras/).

TODO
----

- Use template images to represent menu bar extra icons, as explained in [developer.apple.com - Human Interface Guidelines - Menu Bar Extras](https://developer.apple.com/design/human-interface-guidelines/macos/extensions/menu-bar-extras/);
    - With the current images, the resolution is not good and we need different assets in dark mode.
