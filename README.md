## Usage:
~~After your running ```bundle install```~~, try me by:

```
ruby run.rb
```

## Assumptions:
To make this scoring system simple, we assume:

1. All the input pins are separated by comma and all valid.
2. The input may not be for a complete game, but always starts from the first ball. For example, **10,10,10** scores differently when they are at the first frame and the tenth frame.
3. The score as the output may not be the same as the screen score in bowling games. For example, **1,2,3,4,5,5** scores **20** here, but as the bonus of the spare in the third frame is still unknown, the bowling screen normally shows **10** as the result for the first two frames.   
