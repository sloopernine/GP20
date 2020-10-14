using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [SerializeField]
    float speed;

    Vector2 movement;

    enum MoveMode {

        Translate,
        Force,
        Velocity
    }
    [SerializeField]
    MoveMode currentMoveMode;

    Rigidbody2D rb2D;

    void Start() {

        rb2D = GetComponent<Rigidbody2D>();
    }

    void Update() {

        movement = new Vector2( Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));

        if( movement.sqrMagnitude > 1 ) {

            movement = movement.normalized;
        }

        if( currentMoveMode == MoveMode.Translate ) {

            movement = movement * speed * Time.deltaTime;
            transform.Translate( movement );
        }

        if( currentMoveMode == MoveMode.Velocity ) {

            rb2D.velocity = movement * speed;
        }
    }

    void FixedUpdate() {

        if( currentMoveMode == MoveMode.Force ) {

            rb2D.AddForce(movement * speed);
        }
    }
}
