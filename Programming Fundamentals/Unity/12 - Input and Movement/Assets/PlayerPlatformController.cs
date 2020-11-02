using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPlatformController : MonoBehaviour
{
    private Rigidbody2D rb2d;
    private SpriteRenderer spriteRenderer;
    private Animator animator;
    public CircleCollider2D circleCollider;
        
    public LayerMask raycastMask;
    
    public GameObject ball;
    BasketBallController ballController;

    public float speed;
    public float jumpPower = 10;
    public bool doJump;
    public bool isGrounded = false;
    public float groundedOffset;
    private bool ballInsideTrigger = false;

    Vector2 movement = new Vector2();

    void Start() {

        rb2d = GetComponent<Rigidbody2D>();
        spriteRenderer = GetComponentInChildren<SpriteRenderer>();
        animator = GetComponentInChildren<Animator>();
        ballController = ball.GetComponent<BasketBallController>();
        circleCollider = GetComponent<CircleCollider2D>();
    }

    void Update() {
        
        float x = Input.GetAxis( "Horizontal" );

        if( Input.GetAxisRaw( "Horizontal" ) == 0 ) {
            
            x = 0;
        }
        
        movement = new Vector2( x * speed, rb2d.velocity.y );

        if( isGrounded ) {
            
            animator.SetFloat( "speed", Mathf.Abs( x ) );
            animator.SetBool("falling", false);
            
            if( Input.GetButtonDown( "Jump" ) ) {

                animator.SetTrigger("jump");
                doJump = true;
            }
        } else if( rb2d.velocity.y < -0.2 ) {
            
            animator.SetBool("falling", true);
        }

        if( x > 0 ) {

            circleCollider.offset.Set(0.8f, 0.1f);
            spriteRenderer.flipX = true;
        } else if( x < 0 ) {
            
            circleCollider.offset.Set(-0.8f, 0.1f);
            spriteRenderer.flipX = false;
        }
        
        if( Input.GetButtonDown( "KickBall" ) ) {
            
            animator.SetTrigger("hit");
            if( ballInsideTrigger ) {

                ballController.Kick( transform.position );
            }
        }
    }

    private void FixedUpdate() {

        RaycastHit2D hit = Physics2D.Raycast(transform.position, -Vector2.up, 50f, raycastMask);

        if( hit != null ) {
            
            if( hit.collider.CompareTag("Floor") && hit.distance < groundedOffset ) {

                isGrounded = true;
            }
            else {

                isGrounded = false;
            }
        }
        
        rb2d.velocity = movement;

        if( doJump ) {

            rb2d.AddForce( Vector2.up * jumpPower, ForceMode2D.Impulse );
            doJump = false;
        }
    }

    private void OnTriggerStay2D( Collider2D other ) {

        if( other.gameObject.tag == "Ball" ) {

            ballInsideTrigger = true;
        }
    }
    
    private void OnTriggerExit2D( Collider2D other ) {

        if( other.gameObject.tag == "Ball" ) {

            ballInsideTrigger = false;
        }
    }
}
