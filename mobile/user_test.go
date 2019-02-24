package mobile

import (
  "testing"
)

func TestUserToJSON(t *testing.T) {
  data := []byte(UserJSONExample)
  user, err := NewUser(data)
  if err != nil {
    t.Fatal(err)
  }

  buf,err := user.ToJSON()
  if err != nil {
    t.Fatal(err)
  }

  t.Logf("JSON:%s", buf)
}
