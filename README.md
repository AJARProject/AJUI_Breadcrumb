# AJUI_Breadcrumb

AJUI Breadcrumb is a component made for 4D that help you to create and display breadcrumb in your forms. You can fully customize your breadcrumbs and have templates to easily use the same style everywhere in your application.

A breadcrumb is created via the language and will be displayed in a picture element in your form. The breadcrumb is stored in an object that is an instance of a breadcrumb.

### Documentation

You can find a PDF with a complete documentation on how to use the component.

**Example**

    Case of
      : (Form event=On Load)
        Form.bc:=New AJUI_BreadCrumb

        Form.bc.Name("BreadCrumb")

        Form.bc.AddSection("sect_home";New object("label";"Home"))
        Form.bc.AddSection("sect_products";New object("label";"Products"))
        Form.bc.AddSection("sect_customers";New object("label";"Customers"))
        Form.bc.AddSection("sect_contact";New object("label";"Contact"))
    End case

    Form.bc.Draw()

### Version

1.2.1-Build32  // Wed, 22 Jan 2020 08:57:51 GMT

### Questions?

If you have any question, you can ask them directly on github or write to info@ajar.ch
