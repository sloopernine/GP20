using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasketController : MonoBehaviour
{

    public Rigidbody2D ballRigidBody;

    void Start(){
        
    }

    void Update(){
        
    }

    void OnTriggerEnter2D( Collider2D coll ) {

        Debug.Log (coll.gameObject.tag);

        if( coll.gameObject.tag == "Ball" ) {

            ballRigidBody.velocity = new Vector2(0, ballRigidBody.velocity.y);
            Debug.Log ("should be score");
        }
    }
}
