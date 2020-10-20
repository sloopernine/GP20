using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NetBorderController : MonoBehaviour
{
    public GameObject endPointTarget;

    void Start(){
        
    }

    
    void Update(){
    
        endPointTarget.transform.position = transform.position;
        
    }
}
