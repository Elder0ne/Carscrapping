# Carscrapping
NOT OFFICAL QB-Core Script!

Okok, So here's a resource that i made myself with help from the Community Members in the QBCore Discord,
So thank you to everyone who helped me.

The Script is a Car Scrapping Script where you would remove 1 door on a vehicle and then go to a polyzone
to deliver the door, and player gets the money


Dependencies:
QB-Target 
PolyZone

This is what i use to spawn the ped, https://github.com/sjpfeiffer/ped_spawner feel free to create the ped in any way
Here's how i spawn the ped in the config.lua of the resource ^^

	{
		model = "s_m_y_xmech_02",
		coords = vector3(-1140.81, -1988.15, 13.17), -- Script for carscrap
		heading = 20.0, 
		gender = "male", 
		animDict = "missmechanic", 
		animName = "work_base",
	    isRendered = false,
        ped = nil,
    },

To remove the green polyzones you press CTRL + F search for   debugPoly=true and repalce it with   debugPoly=false



![image](https://user-images.githubusercontent.com/78080230/156892935-7b961f21-48cb-4f47-9ca0-bea0381a5ec3.png)
