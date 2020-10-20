using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasketBallController : MonoBehaviour
{
    Rigidbody2D rb2d;

    public float floorOffsetDistance;
    public bool allowKick;
    public bool doKick;
    public float kickPower;

    void Start(){
        
        rb2d = GetComponent<Rigidbody2D>();
    }


    void Update(){
        
    }

    void FixedUpdate(){

        RaycastHit2D hit = Physics2D.Raycast( transform.position, -Vector2.up );

        if( hit.collider != null ) {

            if( hit.distance < floorOffsetDistance ) {

                allowKick = true;
            } else {

                allowKick = false;
            }
        }

        if( doKick ) {

            rb2d.AddForce (Vector2.up * kickPower, ForceMode2D.Impulse);
            doKick = false;
        }
    }

    void KickUp() {

        if( allowKick && doKick == false ) {

            doKick = true;
        }
    }

    void OnCollisionEnter2D(Collision2D coll) {

        
    }
}
