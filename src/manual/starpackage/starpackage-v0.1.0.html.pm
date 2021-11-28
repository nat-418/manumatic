#lang pollen

◊(define-meta author    "nat-418"
              documents "Starpackage"
              version   "0.1.0")

◊section["Name"]{
  Starpackage — Build standalone executables from Tcl source files.
}

◊section["Synopsis"]{
  ◊command{starpackage}
  ◊parameters{
    ◊parameter["required"]{command}
    ◊parameter["optional variadic"]{arguments}
  }
}

◊section["Description"]{
  Starpacks are bundled Tcl applications that include a runtime,
  dependencies, and source code. The purpose of Starpackage is to
  provide a high-level API that abstracts the building of Starpacks
  into a few core commands:
  ◊list{
    ◊item{
      ◊command{demo}
      ◊describe{
        Initialize an example project and make Starpacks of it.
      }
    }
    ◊item{
      ◊command{init}
      ◊parameter["required"]{name}
      ◊describe{
        Initialize a basic project called ◊italic{name}.
        This will produce the virtual filesystem directory
        and populate it with skeleton files ready to be modified.
      }
    }
    ◊item{
      ◊command{build}
      ◊parameter["required variadic"]{names}
      ◊describe{
        Bundle any number of projects into Starpacks for various platforms
        and architectures. Will create a ◊code{bin/} directory if one
        does not already exist and put Starpacks there.
      }
    }
  }
}

◊section["Examples"]{
  ◊codeblock{
    $ starpackage demo
    $ exa --tree
    .
    ├── bin
    │  ├── demo-linux-i686.kit
    │  └── demo-linux-x86_64.kit
    ├── demo.vfs
    │  ├── lib
    │  └── main.tcl
    └── lib
       ├── runtimes
       │  ├── linux-i686.kit
       │  └── linux-x86_64.kit
       ├── sdx.kit
       └── tclkit-8.6.3-linux-x86_64
  }
}

◊section["See Also"]{
  ◊link["https://wiki.tcl-lang.org/page/Starpack"]{Starpack}
}
