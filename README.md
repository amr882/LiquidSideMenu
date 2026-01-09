# Liquid Side Menu



<p>
    <img src="https://github.com/amr882/LiquidSideMenu/blob/main/assets/gif_screen.gif?raw=true" />
</p>


<p>
    <img src="https://github.com/amr882/LiquidSideMenu/blob/main/assets/screen.png?raw=true" />
</p>


## Getting Started

- Step 1: Add **liquid_side_menu** to **pubspec.yaml**

```yaml
dependencies:
  flutter:
    sdk: flutter
  liquid_side_menu: // verion

```

## how to use 

```dart

 LiquidSideMenu(
        sideMenuIcon: Image.asset("assets/side_menu_icon.svg", height: 15),
        sideMenuItems: [
          SideMenuItem(onTap: () {}, text: "HOME"),
          SideMenuItem(onTap: () {}, text: "PROFILE"),
          SideMenuItem(onTap: () {}, text: "SETTINGS"),
          SideMenuItem(onTap: () {}, text: "HELP"),
          SideMenuItem(onTap: () {}, text: "LOGOUT"),
        ],
        child: HomePage(),
      ),

```

# Author

[Amr Fadel](https://github.com/amr882)
