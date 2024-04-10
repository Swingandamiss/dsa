#include <iostream>
using namespace std;
struct Node {
    int key;
    Node* left;
    Node* right;
    Node(int value) {
        key = value;
        left = right = NULL;
    }
};
class BST {
private:
    Node* root;
    Node* insertRec(Node* root, int key) {
        if (root == NULL)
            return new Node(key);  
        if (key < root->key)
            root->left = insertRec(root->left, key);
        if (key > root->key)
            root->right = insertRec(root->right, key);
        return root;
    }
    void inorderRec(Node* root) {
        if (root != NULL) {
            inorderRec(root->left);
            cout << root->key << " ";
            inorderRec(root->right);
        }
    }
public:
    BST() {
        root = NULL;
    }
    void insert(int key) {
        root = insertRec(root, key);
    }
    void inorder() {
        inorderRec(root);
    }
};
int main() {
    BST bst;
    bst.insert(50);
    bst.insert(30);
    bst.insert(20);
    bst.insert(40);
    bst.insert(70);
    bst.insert(60);
    bst.insert(80);
    cout << "Inorder traversal of the BST: ";
    bst.inorder();
    cout<<endl;
}
