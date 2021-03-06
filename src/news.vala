Gtk.Window window;
Granite.Widgets.DynamicNotebook notebook;

int main (owned string args[]) {
    string[] fakeargs = {};
    unowned string[] fakeargs_s = fakeargs;
    Gtk.init(ref fakeargs_s);

    if(args.length > 2) {
        stdout.puts(args.length.to_string());
        News.AboutDialog();
    } else {
        window = new Gtk.Window();
        window.title = "News";
        window.set_position(Gtk.WindowPosition.CENTER);
        window.set_default_size(950, 950);
        window.destroy.connect(Gtk.main_quit);
        window.set_titlebar(new NewsHeaderBar(window));

        notebook = new Granite.Widgets.DynamicNotebook();
        notebook.new_tab_requested.connect(News.new_tab);
        window.add(notebook);
        // Contestual stylesheet
        string STYLESHEET = """
            @define-color colorPrimary #FF00AA;
            @define-color textColorPrimary #f2f2f2;
            @define-color textColorPrimaryShadow #b20077;""";
        var provider = new Gtk.CssProvider();
        provider.load_from_data(STYLESHEET, -1);
        Gtk.StyleContext.add_provider_for_screen(window.get_screen(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        // Create listbox
        News.add_page(null);

        window.show_all();

        window.resize(950, 950);
    }
    Gtk.main();
    return 0;
}
