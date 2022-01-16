public class ScreenShot : Object {
    private ScreenshotProxy proxy;

    construct {
        try {
                proxy = Bus.get_proxy_sync<ScreenshotProxy> (BusType.SESSION,
                                                             "org.gnome.Shell.Screenshot",
                                                             "/org/gnome/Shell/Screenshot");
            } catch (Error e) {
                error (e.message);
            }
    }

    public async string captureScreen() throws Error {
        Gdk.Rectangle? rect = {};
        bool success = false;
        string filename_used = "";
        //  rect = {};
        yield proxy.select_area (out rect.x, out rect.y, out rect.width, out rect.height);
        //  yield sleep(1000);
        yield proxy.screenshot_area (rect.x, rect.y, rect.width, rect.height, true, "filename.png",
            out success, out filename_used);

        return filename_used;
        
    }

    private async void sleep (int delay) {
        GLib.Timeout.add (delay, () => {
            sleep.callback ();
            return Source.REMOVE;
        });
        yield;
    }

    void saveCapturedScreen() {

    }
}