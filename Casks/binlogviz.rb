cask "binlogviz" do
  version "0.23.3"

  on_macos do
    on_intel do
      sha256 "ca1c19085a829c8b044329a4541a96f17172735162ac3d8800baa3c9db4c71e1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.3/binlogviz_0.23.3_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c6f464741ac9fb9615471f6390618f3b17a49b86a021ffd371f5cd80564ba187"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.3/binlogviz_0.23.3_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "47ec5946a8826b0d423c98ff7476c2a856042bcd0dd076ffc787b848a3dac7c4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.3/binlogviz_0.23.3_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "06170bd6be9a550d9e97d863165e4c3c04dad87f8b9860a735054b21ea345b24"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.3/binlogviz_0.23.3_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
