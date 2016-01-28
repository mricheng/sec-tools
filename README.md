# sec-tools
Curated collection of tools for security research, CTFs, and fun, that I enjoy. Similar to zardus's ctf-tools, but with a more general focus on security.

Installers for the following tools are included:

| Category | Tool | Description |
|----------|------|-------------|
| binary | [apktool](https://ibotpeaches.github.io/Apktool/) | Dissect, dis-assemble, and re-pack Android APKs | 
| binary | [binwalk](https://github.com/devttys0/binwalk.git) | Firmware (and arbitrary file) analysis tool. | 
| binary | [checksec](https://github.com/slimm609/checksec.sh) | Check binary hardening settings. | 
| binary | [peda](https://github.com/longld/peda) | Enhanced environment for gdb. | 
| binary | [preeny](https://github.com/zardus/preeny) | A collection of helpful preloads (compiled for many architectures!). |
| binary | [qemu](http://qemu.org) | Latest version of qemu! |
| binary | [qira](http://qira.me) | Parallel, timeless debugger. | 
| binary | [radare2](http://www.radare.org/) | Some crazy thing crowell likes. | 
| binary | [ropgadget](https://github.com/JonathanSalwan/ROPgadget) | This tool lets you search your gadgets on your binaries to facilitate your ROP exploitation. |
| crypto | [cribdrag](https://github.com/SpiderLabs/cribdrag) | Interactive crib dragging tool (for crypto). | 
| crypto | [evilize](http://www.mathstat.dal.ca/~selinger/md5collision/) | Tool to create MD5 colliding binaries | 
| crypto | [foresight](https://github.com/ALSchwalm/foresight) | A tool for predicting the output of random number generators. To run, launch "foresee". | 
| crypto | [hash-identifier](https://code.google.com/p/hash-identifier/source/checkout) | Simple hash algorithm identifier. | 
| crypto | [pkcrack](https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html) | PkZip encryption cracker. |
| crypto | [padbuster](https://github.com/GDSSecurity/PadBuster) | Automated script for performing Padding Oracle attacks 
| crypto | [python-paddingoracle](https://github.com/mwielgoszewski/python-paddingoracle) | Padding oracle attack automation. | 
| crypto | [ssh_decoder](https://github.com/jjyg/ssh_decoder) | A tool for decoding ssh traffic. You will need `ruby1.8` from `https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng` to run this. Run with `ssh_decoder --help` for help, as running it with no arguments causes it to crash. | 
| crypto | [xortool](https://github.com/hellman/xortool) | XOR analysis tool. | 
| web | [burpsuite](http://portswigger.net/burp) | Web proxy to do naughty web stuff. |
| web | [dirs3arch](https://github.com/maurosoria/dirs3arch) | Web path scanner. | 
| web | [mitmproxy](http://mitmproxy.org/) | A programmable and interactive HTTP proxy useful |
| web | [net-creds](https://github.com/DanMcInerney/net-creds) | Sniffs sensitive data from interface or pcap |
| web | [sqlmap](http://sqlmap.org/) | SQL injection automation engine. | 
| stego | [ElectronicColoringBook](https://doegox.github.io/ElectronicColoringBook/) | Colorize data file according to repetitive chunks. |
| stego | [lsbsteg](https://github.com/RobinDavid/LSB-Steganography) | stego files into images using the Least Significant Bit. |
| stego | [poppler](http://poppler.freedesktop.org/) | A suite of tools to help take apart and work with PDF files |
| stego | [steganabara](http://www.caesum.com/handbook/stego.htm) | Another image steganography solver. | 
| stego | [stegdetect](http://www.outguess.org/) | Steganography detection/breaking tool. | 
| stego | [stegsolve](http://www.caesum.com/handbook/stego.htm) | Image steganography solver. | 
| tools | [bruteforce](http://github.com/eugenekolo/sec-tools) | A simple starter script for bruteforcing |
| tools | [entropy](http://github.com/eugenekolo/sec-tools) | A simple tool to test entropy of a file |
| tools | [extundelete](http://extundelete.sourceforge.net/) | Recover deleted files from an ext3 or ext4 partition. |
| tools | [pyunpack](https://github.com/kholia/exetractor-clone) | Unpacker for packed Python executables |
| tools | [shoe](http://github.com/eugenekolo/sec-tools) | A simple tool to assist with TCP remote communication |
| fuzzer | [afl](http://lcamtuf.coredump.cx/afl/) | State-of-the-art fuzzer. |
| fuzzer | [taintgrind](https://github.com/wmkhoo/taintgrind) | A valgrind taint analysis tool. | 

## Usage
To use, do:

```bash
# set up the path
/path/to/sec-tools/bin/manage-tools.sh setup
source ~/.bashrc

# list the available category/tools
manage-tools.sh list

# install whatever <category/tool-name>
manage-tools.sh install binary/radare2

# use the tool - your path is automatically configured
rabin2 -e /bin/ls
```

The tools attempt to download and install themselves in their desiginated self-contained directory.
The binaries of each tool are soft linked into /path/to/sec-tools/bin which is added to your path when you run `manage-tools setup`

## Adding Tools
To add a tool (say, named *toolname*), do the following:

1. Decide what category it falls under. You probably shouldn't create a new one.
2. Create a `category\toolname` directory.
3. Create an `install-ctf.sh` script.

### Install Scripts
The install script will be run with `$PWD` being `toolname`. It should install the tool into this directory, in as contained a manner as possible.
Ideally, full uninstallation should be possible with a `git clean`.

The install script should create a `bin` directory and put its executables there.
These executables will be automatically linked into the main `bin` directory for the repo.
They could be launched from any directory, so don't make assumptions about the location of `$0`!

## License
The individual tools are all licensed under their own licenses.
As for sec-tools itself, it is "starware".
If you find it useful, star it on github (https://github.com/eugenekolo/sec-tools).

## Acknowledgements
Built upon [ctf-tools](github.zom/zardus/ctf-tools). Be sure to check them out.