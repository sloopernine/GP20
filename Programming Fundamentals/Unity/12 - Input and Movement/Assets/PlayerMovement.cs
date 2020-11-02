using System;
using System.Collections;
using System.Collections.Generic;
using Unity.Mathematics;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    private SpriteRenderer spriteRenderer;
    private Animator animator;
    private Rigidbody2D rb2d;
    public LayerMask raycastMask;

    private Vector2 movement;
    private float moveSpeed = 5;
    public bool isGrounded;
    public float groundedOffset;
    public float jumpForce = 10;
    private bool doJump = false;

    void Start() {

        spriteRenderer = GetComponent<SpriteRenderer>();
        animator = GetComponent<Animator>();
        rb2d = GetComponent<Rigidbody2D>();
    }

    void Update() {

        float x = Input.GetAxis( "Horizontal" );

        if(Input.GetAxisRaw( "Horizontal" ) == 0 ) {

            x = 0;
        }

        if( x < 0 ) {

            spriteRenderer.flipX = true;
        } else if( x > 0 ) {

            spriteRenderer.flipX = false;
        }
        
        movement = new Vector2( x * moveSpeed, rb2d.velocity.y );

        animator.SetFloat( "speed", Mathf.Abs( x ) );

        if( Input.GetButtonDown( "Jump" ) && isGrounded ) {

            doJump = true;
        }
    }

    void FixedUpdate() {

        rb2d.velocity = movement;
            
        RaycastHit2D hit = Physics2D.Raycast(transform.position, -Vector2.up, 50f, raycastMask);

        if( hit != null ) {
            
            Debug.DrawLine(transform.position, hit.point);
        }

        
        if( hit.collider.tag == "Floor" && hit.distance < groundedOffset ) {

            isGrounded = true;
        }
        else {

            isGrounded = false;
        }

        if( doJump ) {
            
            rb2d.AddForce(Vector2.up * jumpForce, ForceMode2D.Impulse);
            doJump = false;
        }
    }
}
