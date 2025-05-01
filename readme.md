<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
    <a href="https://github.com/MaDHouSe79/mh-databaseoptimizer/issues">
        <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-databaseoptimizer"/> 
    </a>
    <a href="https://github.com/MaDHouSe79/mh-databaseoptimizer/watchers">
        <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-databaseoptimizer"/> 
    </a> 
    <a href="https://github.com/MaDHouSe79/mh-databaseoptimizer/network/members">
        <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-databaseoptimizer"/> 
    </a>  
    <a href="https://github.com/MaDHouSe79/mh-databaseoptimizer/stargazers">
        <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-databaseoptimizer?color=white"/> 
    </a>
    <a href="https://github.com/MaDHouSe79/mh-databaseoptimizer/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/MaDHouSe79/mh-databaseoptimizer?color=black"/> 
    </a>      
</p>

### Dependencies
1. [oxmysql](https://github.com/overextended/oxmysql/releases)
2. [qb-core](https://github.com/qbcore-framework/qb-core)
2. [qb-vehiclekeys](https://github.com/qbcore-framework/qb-vehiclekeys) (to check if you are using PersistentKeys)

### Screenshot
![alttext](https://github.com/MaDHouSe79/mh-databaseoptimizer/blob/main/screenshots/screenshot.png?raw=true)

### MH Database Optimizer (QB) (Server Side Only)
- Well the name says it all, it cleans up your database with useless data,
- this optimize your database like requests and search to the database.
- When you have a limited database or not this helps you keep it clean,
- it uses only the data that is realy needed and all other data that is useless will be removed.

### Why i made this?
- well i see scripts that don't think of this and keep adding useless data into the database or in metadata and never remove it.
- like the inventory there are inventories that are no longer exsist or even used,
- same for vehicles that you use on the server, it can be a player owned vehicle but nolonger exist on the server
- this are a few examples that it is useless data and why you want to keep it in your database?
- That's why i created this script cause i don't like useless data in my database,
- this also optimize your database like requests and search to the database.

### When server start this happend

**Inventory Stashes/Trunks/Dumpsters optimize**
- This are inventories that are empty or has no items in it, like trunks from vehicles that does not exist anymore,
- it also remove any inventory that is empty cause when you use it it will be created again by the inventory if it still exsist
- and when you put items in it it will stay remain and it does not delete the inventory cause it is used and has items.

**Player vehicles optimize**
- This only happen when vehicles does not exsist on the server, than player owned vehicles will be removed from the database.

**Delete Non Active Players**
- This only happen when players has not join the server in 60 days, you can change this in the config file..

**Metadata vehicleKeys optimize**
- This cleansup the player metadata vehiclekeys, cause it can be that you have keys that no longer exsist.
- A vehicle that is suddenly yours but that vehicle is not yours but you get a key because this meta stuff in qb-vehiclekeys that is not the best idea to do.
- it can happen that you have a key from a vehicle plate that is not yours but you have a key, this can also be the case by a player vehicle.
- So I recommend to turn this off in qb-vehiclekeys because it doesn't really make any sense to use.

### LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
