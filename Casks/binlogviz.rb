cask "binlogviz" do
  version "0.23.32"

  on_macos do
    on_intel do
      sha256 "7bdaceee199a797be66f9d866b1d14e466965f4f07d9033d7426eb3051ddc467"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.32/binlogviz_0.23.32_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "f1168ecf9faffd89fe2994ff4530ebd4a2b4df555a733eaff4e323d65e38fb7f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.32/binlogviz_0.23.32_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "5133038efcd0cd9b0d9f551509c09fa7296cd74c3132585a28162dc51953ad7d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.32/binlogviz_0.23.32_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "0597cfe81592a489ef3def3fb7174b44335ee697ff99f9ccfef1b5f834bf68dd"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.32/binlogviz_0.23.32_linux_arm64.tar.gz",
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
