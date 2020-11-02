using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasketBallController : MonoBehaviour
{
    Rigidbody2D rb2d;
    AudioSource audioSource;

    public AudioClip[] audioClips;

    public float floorOffsetDistance;
    public bool allowKick;
    public bool doKick;
    public float kickPower;

    void Start(){
        
        rb2d = GetComponent<Rigidbody2D>();
        audioSource = GetComponent<AudioSource>();

    }
    
    public void Kick( Vector2 pos ) {

        Vector2 dir = ( new Vector2(transform.position.x, transform.position.y) - pos );
        rb2d.velocity = Vector2.zero;
        
        rb2d.AddForce (dir * kickPower, ForceMode2D.Impulse);
        
        if( doKick == false ) {

            doKick = true;
        }
    }

    void OnCollisionEnter2D( Collision2D coll ) {

        if( rb2d.velocity.y < 1 ) {
            
            rb2d.velocity = new Vector2(rb2d.velocity.x, 0);
        }

        if( coll.gameObject.tag == "Floor" ) {

            audioSource.PlayOneShot( audioClips[ 1 ] );
        } else {

            //audioSource.PlayOneShot( audioClips[ 2 ] );
        }
    }
}
