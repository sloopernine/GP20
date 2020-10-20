using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPlatformController : MonoBehaviour
{
    public float speed;
    public float jumpPower = 10;
    public bool doJump;


    Rigidbody2D rb2d;
    Vector2 movement = new Vector2();

    void Start() {

        rb2d = GetComponent<Rigidbody2D>();
    }

    void Update() {

        float x = Input.GetAxis( "Horizontal" );

        movement = new Vector2( x * speed, rb2d.velocity.y );

        if( Input.GetButtonDown( "Jump" ) ) {

            doJump = true;
            Debug.Log (doJump);
        }
    }

    private void FixedUpdate() {

        rb2d.velocity = movement;

        if( doJump ) {

            rb2d.AddForce( Vector2.up * jumpPower, ForceMode2D.Impulse );
            doJump = false;
        }
    }
}
