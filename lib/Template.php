<!-- Where our classes and libraries go -->
<?php
class Template {
    // Path to template
    protected $template;
    // Vars passed in
    protected $vars = array();

    // Constructor
    public function __construct($template) {
        $this->template = $template;
    }

    public function __get($key) {
        return $this->vars[$key];
    }

    public function __set($key, $value) {
        $this->vars[$key] = $value;
    }

    // Instead of 
    // $template->name; will be
    // $name
    public function __toString() {
        extract($this->vars);
        // If we want to find the path name
        chdir(dirname($this->template));
        ob_start(); //Starts output buffering

        include basename($this->template);

        return ob_get_clean();
    }
    // This is a template that can be used in a lot of different projects
}
?>
