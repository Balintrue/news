# news
A news viewer for elementary os

![Screenshot](https://raw.githubusercontent.com/Allen-B1/news/master/Screenshot%20from%202017-09-09%2011.57.53.png)

# Installation
```bash
git clone https://github.com/allen-b1/news.git
cd news
cmake /usr ./
make
sudo make install
```
## Alternate
If the above doesn't work, try this:

```bash
sudo apt-get install libgtk-3-dev
sudo apt-get install valac

git clone https://github.com/allen-b1/news.git
cd news/src
valac news.vala --pkg gtk+-3.0
./news
```
