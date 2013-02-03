ActionSprite
------------
A CCSprite subclass that will take any number of CCActions and queue them for execution in sequence.

Demo Code
---------
The demo code just puts an ActionSprite on the screen and waits for a click. Clicking anywhere on the screen will add a predefined action to the sprite's action queue and the sprite will start animating. Repeated clicks will add move actions to the queue to be executed in sequence. The predefined actions will move the sprite around the screen in a rectangle path. Every 5th click will add a rotate action that is executed immediately, bypassing the action queue. The label in the center will keep a count of the number of actions remaining to execute on the ActionSprite. When all actions have been executed the sprite will wait for more to be added.