class TextContentWindow : Gtk.Window {
    public TextContentWindow (string extractedContent) {
        this.title = "Extracted text";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_default_size (640, 480);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
        this.add (box);

        Gtk.ScrolledWindow scrolled = new Gtk.ScrolledWindow (null, null);
        box.pack_start (scrolled, true, true, 0);

        Gtk.TextView view = new Gtk.TextView ();
        view.set_wrap_mode (Gtk.WrapMode.WORD);
        view.buffer.text = extractedContent;
        scrolled.add (view);

        Gtk.Button button = new Gtk.Button.with_label ("Exit");
        box.pack_start (button, false, true, 0);
        button.clicked.connect (() => {
            Process.exit(0);
        });
        this.destroy.connect(() => {
            Process.exit(0);
        }) ;
        show_all () ;
    }

    construct {
        Hdy.init () ;
    }
}
